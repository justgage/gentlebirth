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

# inside a "_posts" directory...
directory '_pages' do
  # ...iterate over the "Blog post" records...
  dato.pages.each do |page|
    # ...and create a markdown file for each article!
    create_post "#{page.slug}.md" do
      frontmatter(
        :yaml,
        title: page.title,
        permalink: "/#{page.slug}",
        layout: 'page',
        seo_meta_tags: page.seo_meta_tags,
        body: page.content.to_hash
      )
    end
  end
end
