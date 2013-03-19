class Message
  attr_reader :content


  def initialize(content)
    @content = content
  end

  def valid?
    @content.length <= 160
  end



end