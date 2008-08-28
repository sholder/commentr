atom_feed(:schema_date => '2008', :root_url => site_url(@site.id),
          :url => formatted_site_url(:id => @site.id, :format => :atom)) do |feed|
  feed.title("Recent comments on #{@site.name}")
  comments = @site.comments.newest_first
  feed.updated(comments.first ? comments.first.created_at : Time.now.utc)

  for comment in comments
    feed.entry(comment) do |entry|
      entry.title("#{comment.nickname} at #{comment.created_at}")
      entry.content(comment.text, :type => 'text')

      entry.author do |author|
        author.name(comment.nickname)
      end
    end
  end
end
