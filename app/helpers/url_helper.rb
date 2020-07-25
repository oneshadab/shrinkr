module UrlHelper
  def cleaned(url)
    if has_protocol(url)
      return url
    end

    return set_protocol(url, 'http')
  end

  def set_protocol(url, protocol)
    url = remove_protocol(url) # Remove any existing protocols
    return protocol + "://" + url
  end

  def remove_protocol(url)
    if !has_protocol(url)
      return url
    end

    return url.split('://')[1..].join('://')
  end

  def has_protocol(url)
    return url.split('://').length > 1
  end
end
