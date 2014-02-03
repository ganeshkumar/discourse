APP_ID =  'a57gewjdndfuerjfdfdn8u'

APP_SECRET  = "skhd73y7yrfjh98rejenfdiyhy7eu33j43jwd72j3e"


SMOKE_FREE_URLS = YAML.load_file("#{Rails.root}/config/smoke_free_url_config.yml")[Rails.env]