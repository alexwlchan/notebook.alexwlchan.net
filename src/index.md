---
layout: page
---

## Notebook entries

<div id="notebook_filters">
  Filtering to notes tagged with
</div>

<ul id="notebook_index">
{% for post in site.posts %}
<li class="{% for tag in post.tags %}tagged_with_{{ tag }} {% endfor %}">
  <div>
    <div class="notebook_index__url">
      <a href="{{ post.url }}">{{ post.title | smartify }}</a> <br/>
    </div>
    {% if post.tags %}
    <div class="notebook_index__tags">
      Tagged with:
      {% assign sorted_tags = post.tags | sort %}
      {% for tag in sorted_tags %}
        <a href="#" onclick="filterToTag('{{ tag }}')">{{ tag }}</a>
      {% endfor %}
    </div>
    {% endif %}
  </div>
</li>
{% endfor %}
</ul>
