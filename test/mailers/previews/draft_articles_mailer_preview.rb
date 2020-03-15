class DraftArticlesMailerPreview < ActionMailer::Preview
  def no_author
    DraftArticlesMailer.no_author('test@example.com')
  end
end
