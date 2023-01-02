class Page
    attr_reader :url, :name

    def initialize(url, name)
        @url = url
        @name = name
    end

    def name()
        @name
    end
    def url()
        @url
    end
end