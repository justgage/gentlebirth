# frozen_string_literal: true
create_data_file(
  '_data/settings.yml',
  :yaml,
  favicon_meta_tags: dato.site.favicon_meta_tags
)

# # inside a "_posts" directory...
# directory '_posts' do
#   # ...iterate over the "Blog post" records...
#   dato.posts.each do |article|
#     # ...and create a markdown file for each article!
#     create_post "#{article.date}-#{article.slug}.md" do
#       frontmatter(
#         :yaml,
#         title: article.title,
#         date: article.date || article.updated_at,
#         permalink: "/#{article.slug}",
#         layout: 'post',
#         seo_meta_tags: article.seo_meta_tags
#       )
#
#       content(article.content)
#     end
#   end
# end


homepage, *pages = dato.pages

create_post "index.md" do
  frontmatter(
    :yaml,
    title: homepage.title,
    permalink: '/',
    layout: 'page',
    seo_meta_tags: homepage.seo_meta_tags,
    body: homepage.content.to_hash,
    position: homepage.position
  )
end

# inside a "_posts" directory...
directory '_pages' do
  pages.each do |page|
    create_post "#{page.slug}.md" do
      frontmatter(
        :yaml,
        title: page.title,
        permalink: "/#{page.position == 1 ? "/" : page.slug}",
        layout: 'page',
        seo_meta_tags: page.seo_meta_tags,
        body: page.content.to_hash,
        position: page.position
      )
    end
  end
end
