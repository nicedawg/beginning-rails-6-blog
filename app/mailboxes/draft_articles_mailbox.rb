class DraftArticlesMailbox < ApplicationMailbox
  before_processing :require_author

  def process
    author.articles.create(
      title: mail.subject,
      body: mail.body,
    )
  end

  private

  def require_author
    bounce_with DraftArticlesMailer.no_author(mail.from) unless author
  end

  def author
    @author ||= User.find_by(draft_article_token: token)
  end

  def token
    mail.to.first.split('@').first
  end
end
