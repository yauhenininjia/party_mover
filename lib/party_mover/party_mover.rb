class PartyMover
  class << self
    def move!(uploader, mounted_as, *instances)
      i_d_like_to_move_it_move_it(uploader, mounted_as, *instances)
      move_it!
    end

    private

    def i_d_like_to_move_it_move_it(uploader, mounted_as, *instances)
      @uploader = uploader
      @mounted_as = mounted_as
      @instances = instances.flatten
    end

    def move_it!
      @instances.each do |instance|
        @current_instance = instance
        save_content
        store_content
        clean_content
      end
    end

    def save_content
      File.open(content_path, 'wb') do |file|
        file.write(content)
      end
    end

    def store_content
      @uploader.new(@current_instance, @mounted_as).store!(File.open(content_path))
    end

    def clean_content
      File.delete(content_path)
    end

    def content_path
      Rails.root.join('tmp', content_name)
    end

    def content_name
      @current_instance.send(@mounted_as).file.path.split('/').last
    end

    def content
      @current_instance.send(@mounted_as).read
    end
  end
end
