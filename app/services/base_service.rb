class BaseService
  def self.call(*args)
    service = new(*args)
    service.call
    service
  end

  def errors
    @errors ||= []
  end

  def success?
    errors.empty?
  end

  def first_error
    errors.first
  end

  def add_error(error)
    return if error.blank?

    case error
    when StandardError
      errors << error
    when Array
      error.each { |e| add_error(e) }
    when String
      err = StandardError.new(error)
      add_error(err)
    end
  end
end
