class Todo < ActiveRecord::Base
  attr_accessible :title, :body, :list_name, :todo_count, :status
  before_save :parameterize_list_name

  CODE_TO_DESCRIPTION = {
    '0' => 'incomplete',
    '1' => 'complete',
    '2' => 'in_progress',
    '3' => 'moved',
    '4' => 'deleted',
    '5' => 'postponed',
    '6' => 'important' 
  }

  DESCRIPTION_TO_CODE = CODE_TO_DESCRIPTION.invert

  def parameterize_list_name
    self.list_name = self.list_name.parameterize
  end

  def status_description=(arg)

  end

  def status_description
    CODE_TO_DESCRIPTION[self.status.to_s]
  end

  def status_description=(arg)
    self.status = DESCRIPTION_TO_CODE[arg].to_i
    self.save
  end

  class << self
    def list_all(stat_descrip)
      self.where :status => DESCRIPTION_TO_CODE[stat_descrip]
    end
  end
end
