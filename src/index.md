---
layout: page
---

## All entries

<ul class="archive home">
{% for post in site.posts %}
<li>
  <div>
    <div class="archive__date">
      {{ post.date | date: "%-d %b %y" }}
    </div>
    <div class="archive__url">
      <a href="{{ post.url }}">{{ post.title | smartify }}</a> <br/>
      {{ post.summary | smartify }}
    </div>
  </div>
</li>
{% endfor %}
</ul>
