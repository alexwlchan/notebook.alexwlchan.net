---
layout: page
---

## All entries

<ul class="archive home">
{% for post in site.posts %}
<li>
  <div>
    <div class="archive__date">
      {% assign post_date = post.date | date: "%-d %b %y" %}

      {% if prev_post_date == nil %}
        {{ post_date }}
      {% elsif prev_post_date != post_date %}
        {{ post_date }}
      {% endif %}

      {% assign prev_post_date = post_date %}
    </div>
    <div class="archive__url">
      <a href="{{ post.url }}">{{ post.title | smartify }}</a> <br/>
      {{ post.summary | smartify }}
    </div>
  </div>
</li>
{% endfor %}
</ul>
