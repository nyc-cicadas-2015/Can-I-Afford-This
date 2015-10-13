module ApplicationHelper
  # Use this rather than hardcoding the placeholder in your views
  #
  # If you wanted to be really smart, you would set this in the rails
  # app config, and then reference it here.
  #
  def placeholder_image_url
    Rails.configuration.placeholder_image
  end
end
