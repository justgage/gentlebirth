# inside a "_posts" directory...
directory "_posts" do

  # ...iterate over the "Blog post" records...
  dato.posts.each do |article|

    # ...and create a markdown file for each article!
    create_post "#{article.date}-#{article.slug}.md" do
      frontmatter(
        :yaml,
        title: article.title,
        date: article.date || article.updated_at,
        permalink: "/#{article.slug}",
        layout: "post"
      )

      content(article.content)
    end
  end
end

# inside a "_posts" directory...
directory "_pages" do

  # ...iterate over the "Blog post" records...
  dato.pages.each do |page|

    # ...and create a markdown file for each article!
    create_post "#{page.slug}.md" do
      frontmatter(
        :yaml,
        title: page.title,
        permalink: "/#{page.slug}",
        layout: "page"
      )

      content(page.content)
    end
  end
end
