module PostModelViewAddons
  def friendly_date
  	date.strftime("%e %B %Y")
  end
end

Ruhoh.model('posts').send(:include, PostModelViewAddons)