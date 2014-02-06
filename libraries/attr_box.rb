class Chruby
  class AttrBox < BasicObject
    def initialize
      @attributes = {}
    end

    def method_missing(name, *args)
      case args.size
      when 0
        @attributes[name.to_sym]
      when 1
        @attributes[name.to_sym] = args.first
      else
        nil
      end
    end
  end
end
