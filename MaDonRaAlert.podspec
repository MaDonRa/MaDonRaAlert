
Pod::Spec.new do |s|



  s.name         = "MaDonRaAlert"
  s.version      = "0.0.1"
  s.summary      = "Custom AlertView you can edit text, image, color."

  s.description  = "you can edit anything on AlertView text, image, color."

  s.homepage     = "https://www.facebook.com/bank.sakkaphong"
  

  s.license      = "MaDonRa"

  s.author             = { "MaDonRa" => "bank-681@hotmail.com" }


  s.platform     = :ios, "9.0"


  s.source       = { :git => "https://github.com/MaDonRa/MaDonRaAlert.git", :tag => s.version }

  s.source_files  = 'MaDonRaAlert/**/*.{m,h,swift}'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

end
