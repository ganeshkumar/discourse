APP_ID =  'a57gewjdndfuerjfdfdn8u'

APP_SECRET  = "skhd73y7yrfjh98rejenfdiyhy7eu33j43jwd72j3e"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :smoke_free_project_strategy, APP_ID, APP_SECRET
end