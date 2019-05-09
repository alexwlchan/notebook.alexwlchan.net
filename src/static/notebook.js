function filterToTag(t) {
  li_tags = document.getElementById("notebook_index").getElementsByTagName("li");
  for (i = 0; i < li_tags.length; i++) {
    item = li_tags.item(i);

    if (item.classList.contains("tagged_with_" + t)) {
      continue;
    }

    if (item.classList.contains("not_tagged_with_" + t)) {
      continue;
    }

    item.classList.add("not_tagged_with_" + t);
    item.style.display = "none";
  }

  url = new URL(window.location.href);
  if (!url.searchParams.getAll("tag").includes(t)) {
    url.searchParams.append("tag", t);
    window.history.pushState({path: url.href}, "", url.href);
  }

  filters = document.getElementById("notebook_filters");
  filters.style.display = "block";

  if (document.getElementById("tag_filter__" + t) === null) {
    filters.innerHTML += '<span id="tag_filter__' + t + '" class="tag_filter">' + t + '<a class="remove_tag" href="#" onclick=unfilterTag(' + "'" + t + "'" + ')>x</a></span>';
  }
}

function isUntagged(classList) {
  for (i = 0; i < classList.length; i++) {
    if (classList[i].startsWith("not_tagged_with_")) {
      return false;
    }
  }
  return true;
}

function unfilterTag(t) {
  li_tags = document.getElementById("notebook_index").getElementsByTagName("li");
  for (i = 0; i < li_tags.length; i++) {
    item = li_tags.item(i);

    if (!item.classList.contains("not_tagged_with_" + t)) {
      continue;
    }

    item.classList.remove("not_tagged_with_" + t);

    if (isUntagged(item.classList)) {
      item.style.display = "list-item";
    }
  }

  document.getElementById("tag_filter__" + t).remove();

  var url = new URL(window.location.href);
  existingTags = url.searchParams.getAll("tag");
  url.searchParams.delete("tag");
  for (i = 0; i < existingTags.length; i++) {
    if (existingTags[i] !== t) {
      url.searchParams.append("tag", existingTags[i]);
    }
  }
  window.history.pushState({path: url.href}, "", url.href);

  if (url.searchParams.getAll("tag").length == 0) {
    document.getElementById("notebook_filters").style.display = "none";
  }
}

window.onload = function() {
  params = new URLSearchParams(window.location.search);

  tags = params.getAll("tag");
  for (i = 0; i < tags.length; i++) {
    filterToTag(tags[i]);
  }

  filtered_tags = tags;
}
