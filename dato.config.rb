# inside a "_posts" directory...
directory "_posts" do

  # ...iterate over the "Blog post" records...
  dato.posts.each do |article|

    # ...and create a markdown file for each article!
    create_post "#{article.date}-#{article.slug}.md" do
      frontmatter(
        :yaml,
        title: article.title,
        date: article.date,
        permalink: "/#{article.slug}",
        layout: "post"
      )

      content(article.content)
    end
  end
end
