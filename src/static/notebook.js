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

  if (typeof filtered_tags === 'undefined') {
    filtered_tags = [t];
  } else {
    if (filtered_tags.includes(t)) {
      return;
    }

    filtered_tags = filtered_tags.concat(t);
  }

  filters = document.getElementById("notebook_filters");
  filters.style.display = "block";

  filters.innerHTML += '<span id="tag_filter__' + t + '" class="tag_filter">' + t + '<a class="remove_tag" href="#" onclick=unfilterTag(' + "'" + t + "'" + ')>x</a></span>';
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
  filtered_tags = filtered_tags.filter(function(it) { return it !== t });

  if (filtered_tags.length == 0) {
    document.getElementById("notebook_filters").style.display = "none";
  }
}
