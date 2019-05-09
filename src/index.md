---
layout: page
---

## All entries

<style>
  li[class^="not_tagged_with"] {
    display: none;
  }
</style>

<script>
  function filterToTag(t) {

  }
</script>

<ul class="notebook_index">
{% for post in site.posts %}
<li class="{% for tag in post.tags %}tagged_with_{{ tag }} {% endfor %}">
  <div>
    <div class="notebook_index__date">
      {% assign post_date = post.date | date: "%-d %b %y" %}

      {% if prev_post_date == nil %}
        {{ post_date }}
      {% elsif prev_post_date != post_date %}
        {{ post_date }}
      {% endif %}

      {% assign prev_post_date = post_date %}
    </div>
    <div class="notebook_index__url">
      <a href="{{ post.url }}">{{ post.title | smartify }}</a> <br/>
      {{ post.summary | smartify }}

      {% assign sorted_tags = post.tags | sort %}
      {% for tag in sorted_tags %}
        {{ tag }}
      {% endfor %}
    </div>
  </div>
</li>
{% endfor %}
</ul>
