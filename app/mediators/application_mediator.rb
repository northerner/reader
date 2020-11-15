class ApplicationMediator
  def self.run(**args)
    new(**args).call
  end
end
