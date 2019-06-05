  class LRUCache

    attr_reader :cache, :cache_size

    def initialize(cache_size)
        @cache_size = cache_size.to_i
        @cache = Array.new
    end

    def count
      # returns number of elements currently in cache
      cache.count
      
    end

    def add(el)
      # adds element to cache according to LRU principle
        if cache.include?(el)
            cache.delete(el)
            cache << el
        end

        if count > cache_size
            cache.shift
            cache << el
        else
            cache << el
        end
    end

    def show
      # shows the items in the cache, with the LRU item first
      cache
    end

    private
    # helper methods go here!

  end