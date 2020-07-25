class Url < ApplicationRecord
  include UrlHelper

  def self.get_or_create(original:)
    digest = ApplicationController.helpers.generate_digest(original)

    existing_url = find_by(digest: digest)
    if existing_url == nil
      return create(original: original, digest: digest)
    end

    if existing_url.original != original
      # To-Do: Handle digest collisions properly
      raise "Existing digest found with different url!"
    end

    return existing_url
  end
end
