module Markaby
  module ERuby
    SELF_CLOSING_TAGS = [ :base, :meta, :link, :hr, :br, :param, :img, :area, :input, :col ]
    def self.convert(rhtml)
      mab, rhtml = [], rhtml.to_s
      until rhtml.empty?
        partial, rhtml = chomp(rhtml)
        mab << partial
      end
      return mab.join
    end
    def self.chomp(str)
      partial = case str
        when /\A<%=(.+?)%>/m then "text(#{$1.strip})\n"
        when /\A<%(.+?)%>/m then $1
        when /\A([\s]+)/ then $1 # whitespace
        when /\A<(\w+)>(.+?)<\/\w+?>/ then "#{$1} #{stringify($2)}" # <h2>Simple</h2>
        when /\A<\/\w+?>/ then 'end' # </div>
        when /\A<(#{SELF_CLOSING_TAGS.join('|')})( [^>]+?)?>/ # <br>
          "#{$1}#{convert_attributes($2)}"
        when /\A<(\w+?)( [^>]+?)?\/>/ # <input foo="bar"/>
          "#{$1}#{convert_attributes($2)}"
        when /\A<(\w+?)( [^>]+?)?>/ # <div foo="bar">
          "#{$1}#{convert_attributes($2)} do"
        else
          partial = ''
          while str !~ /\A([\n]|<\/|<[a-z])/
            partial << str.slice!(0, 1)
          end
          return "text #{stringify(partial)}", str
      end
      return partial, $'
    end
    def self.convert_attributes(attrs)
      return nil if attrs.nil? || attrs.strip.empty?
      return ' ' + attrs.scan(/(\w+?)="(.+?)"/).map { |(k, v)| "%p => '%s'" % [k.to_sym, v] }.join(', ')
    end
    def self.stringify(str)
      return ("%p" % str).gsub(/<%=(.+?)%>/){ "\#{#{$1}}" }
    end
  end
end

Dir['*.html.erb'].each do |input|  
  output = input.sub(/\.(.+?)\Z/, '.mab')
  File.open(output, 'w+') do |out|
    puts "=> Converting #{input} to #{output}"
    out.puts Markaby::ERuby.convert(File.read(input))
  end
end