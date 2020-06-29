module GraphDrawable
  extend ActiveSupport::Concern

  def unique_access_name
    categories = Category.all
   	categories.pluck(:name)
  end

  def total_unique_access
    categories = Category.all
    tendencies = []
    categories.each do |category|
      unique_access = 0
      Test.where(category_id: category.id).each do |test|
        unique_access += test.impressionist_count(:filter=>:ip_address)
      end

      tendencies.push(unique_access)
    end
    return tendencies
  end
end