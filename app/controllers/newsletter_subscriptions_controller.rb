class NewsletterSubscriptionsController < ApplicationController
  
  def create
    NewsletterSubscription.create(params[:newsletter_subscription])
    flash[:notice] = "Your are now subscribed to the nProv newsletter."
    redirect_to root_path
  end

end
