# require modules here
require "yaml"
require "pry"

=begin
path = "lib/emoticons.yml"

yml_hash = {"angel"=>["O:)", "\u261C(\u2312\u25BD\u2312)\u261E"], "angry"=>[">:(", "\u30FD(\uFF4F
`\u76BF\u2032\uFF4F)\uFF89"], "bored"=>[":O", "(\u0398\u03B5\u0398;)"], "confused"=>["
%)", "(\u309C.\u309C)"], "embarrased"=>[":$", "(#^.^#)"], "fish"=>["><>", ">\u309C))))
\u5F61"], "glasses"=>["8D", "(^0_0^)"], "grinning"=>["=D", "(\uFFE3\u30FC\uFFE3)"], "h
appy"=>[":)", "(\uFF3E\uFF56\uFF3E)"], "kiss"=>[":*", "(*^3^)/~\u2606"], "sad"=>[":'("
, "(\uFF34\u25BD\uFF34)"], "surprised"=>[":o", "o_O"], "wink"=>[";)", "(^_-)"]}
=end

def load_library(path)
  emotes = YAML.load_file(path)
  output = {"get_meaning" => {}, "get_emoticon" => {}}
  emotes.each do |name, ejarr|
    ejarr.each_with_index do |emoticon, i|
      if i == 0
        output["get_emoticon"][emoticon] = ejarr[1]
      else
        output["get_meaning"][emoticon] = name
      end
    end
  end
  output
end

# load_library(path)

def get_japanese_emoticon(path, emoticon)
  emoz = load_library(path)
  jap_emo = ''
  emoz.each do |get, hash|
    if get == "get_emoticon"
      hash.each do |english, jap|
        if emoticon == english
          jap_emo = jap
        end
      end
    end
  end
  if jap_emo == ''
    jap_emo = "Sorry, that emoticon was not found"
  else
    jap_emo
  end
end

def get_english_meaning(path, emoticon)
  emoz = load_library(path)
  jap_emo = ''
  emoz.each do |get, hash|
    if get == "get_meaning"
      hash.each do |english, jap|
        if emoticon == english
          jap_emo = jap
        end
      end
    end
  end
  if jap_emo == ''
    jap_emo = "Sorry, that emoticon was not found"
  else
    jap_emo
  end
end
