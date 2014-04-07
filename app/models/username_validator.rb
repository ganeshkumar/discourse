class UsernameValidator
  # Public: Perform the validation of a field in a given object
  # it adds the errors (if any) to the object that we're giving as parameter
  #
  # object - Object in which we're performing the validation
  # field_name - name of the field that we're validating
  #
  # Example: UsernameValidator.perform_validation(user, 'name')
  def self.perform_validation(object, field_name)
    validator = UsernameValidator.new(object.send(field_name))
    unless validator.valid_format?
      validator.errors.each { |e| object.errors.add(field_name.to_sym, e) }
    end
  end

  def initialize(username)
    @username = username
    @errors = []
  end
  attr_accessor :errors
  attr_reader :username

  def user
    @user ||= User.new(user)
  end

  def valid_format?
    username_exist?
    errors.empty?
  end

  private

  def username_exist?
    return unless errors.empty?
    unless username
      self.errors << I18n.t(:'user.username.blank')
    end
  end

end
