require 'rqrcode'
require 'rqrcode_png'

namespace :qrcode do
  desc 'VoteTokenのtokenが埋め込まれているQRコードを生成します。'
  task generate: :environment do
    VoteToken.all.each do |vote_token|
      content = vote_token.token
      size = 3
      level = :h
      qr  = RQRCode::QRCode.new(content, size: size, level: level)
      png = qr.to_img
      png.resize(500, 500).save("#{Rails.root}/qrcodes/#{vote_token.id}.png")
    end
  end
end
