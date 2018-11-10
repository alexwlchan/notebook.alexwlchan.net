---
layout: post
title: Using Typesafe for config in Scala apps
date: 2018-11-10 16:59:30 +0000
tags: scala
---

I've just been doing a bunch of work (see [wellcometrust/platform#2967](https://github.com/wellcometrust/platform/issues/2967) and related patches) to use Typesafe for config in our Scala apps, and ditch our use of Guice/Finatra and dependency injection.

Disentangling the key bits was moderately fiddly, so these are notes on how I got it working.

1.  Config file.
    An example is easiest:

    ```ini
    app.contextURL="https://example.org/context.json"
    app.namespace=notifier
    ```

    Note that strings have to be quoted, or the Typesafe parser things they're part of the format.

2.  Pass the path to the config file with the `-Dconfig.file` flag.
    For example:

    ```console
    $ /opt/docker/bin/application -Dconfig.file=/opt/docker/conf/application.conf
    ```

3.  Load the config using the factory:

    ```scala
    import com.typesafe.config.{Config, ConfigFactory}

    object Main extends App {
      val config: Config = ConfigFactory.load()

      ...
    }
    ```

4.  Add the helper class for reading config flags:

    ```scala
    import com.typesafe.config.Config

    object EnrichConfig {
      implicit class RichConfig(val underlying: Config) extends AnyVal {
        def get[T](path: String): Option[T] =
          if (underlying.hasPath(path)) {
            Some(underlying.getAnyRef(path).asInstanceOf[T])
          } else {
            None
          }

        def required[T](path: String): T =
          get(path).getOrElse {
            throw new RuntimeException(s"No value found for path $path")
          }

        def getOrElse[T](path: String)(default: T): T =
          get(path).getOrElse(default)
      }
    }
    ```

5.  Read values from the config.
    For example:

    ```scala
    import EnrichConfig._

    object Main extends App {
      ...

      val namespace: String = config
        .required[String]("app.namespace")

      val contextUrl = config
        .getOrElse[String]("app.contextURL")(default = "context.json")

      val waitTime: Option[Int] = config
        .get[Int]("app.startUpTime")(default = 10)
    }
    ```