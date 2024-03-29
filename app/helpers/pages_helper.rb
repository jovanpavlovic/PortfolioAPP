module PagesHelper
  def twitter_parser tweet
    regex = %r{
      \b
      (
        (?: [a-z][\w-]+:
         (?: /{1,3} | [a-z0-9%] ) |
          www\d{0,3}[.] |
          [a-z0-9.\-]+[.][a-z]{2,4}/
        )
        (?:
         [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
        )+
        (?:
          \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
          [^\s`!()\[\]{};:'".,<>?«»“”‘’]
        )
      )
    }ix #regullar expresion, trazi pattern za url, excluduje :'".,<>?«»“”‘’

    tweet.gsub(regex) do |url|#global subtitution
      "<a href='#{url}' target='_blank'>#{url}</a>"#new tab uzima url iz stringa
    end.html_safe
  end
end