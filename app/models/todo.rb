class Todo < ActiveRecord::Base
  belongs_to :project

  def completed_at=(ms)
    raise 'Invalid Type.' unless ms.respond_to?(:to_i)

    if ms.present?
      write_attribute(:completed_at, Time.at(ms.to_i))
    else
      super
    end
  end
end

