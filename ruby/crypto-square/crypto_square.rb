class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @normalized_plaintext ||= text.gsub(/\W/, '').downcase
  end

  def size
    @size ||= Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    @plaintext_segments ||=
      normalize_plaintext.chars.each_slice(size).map(&:join)
  end

  def ciphertext
    @ciphertext ||= ciphertext_segments.join
  end

  def normalize_ciphertext
    @normalize_ciphertext ||= ciphertext_segments.join(' ')
  end

  private

  attr_reader :text

  def ciphertext_segments
    @ciphertext_segments ||= (0...size).map do |i|
      plaintext_segments.map { |s| s[i] }.join
    end
  end
end
