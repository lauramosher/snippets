import project.config as config

class Thinger():
  def __init__(self):
    self.message = "Thinger data from %s days ago"

  def call(self):
    config.logger.info(self.message, config.run_days_ago)
