# #RubyMetaMonday 💻

# ⚡ Empower your Ruby code with dynamic method 𝗱𝗶𝘀𝗽𝗮𝘁𝗰𝗵
#  🤖Thankfully, due to 𝗥𝘂𝗯𝘆'𝘀 𝗢𝗢𝗣 𝗻𝗮𝘁𝘂𝗿𝗲, we can dynamically invoke any method
# on an object by passing the method name as a symbol or string.
# 😎 In scenarios where we don't know the method name until runtime or want to
# call methods with similar names, 𝘀𝗲𝗻𝗱 becomes your 𝘮𝘦𝘫𝘰𝘳 𝘢𝘮𝘪𝘨𝘰:

# ✔'𝐬𝐞𝐧𝐝'.       Use carefully, as this guy is your #1 privacy breaker
# ✔ '𝐩𝐮𝐛𝐥𝐢𝐜_𝐬𝐞𝐧𝐝' Your  '𝘤𝘢𝘭𝘭 𝘰𝘯𝘭𝘺 𝘱𝘶𝘣𝘭𝘪𝘤 𝘈𝘗𝘐' mate after 10mins on Web
# 🕵‍♂️ Your '𝘖𝘯𝘭𝘺 𝘚𝘳 𝘓𝘦𝘷𝘦𝘭' style
# ✔'__𝐬𝐞𝐧𝐝__'   When '𝐬𝐞𝐧𝐝' defined
# ✔ '𝐨𝐛𝐣.𝐬𝐞𝐧𝐝(𝐌𝐄𝐓𝐇𝐎𝐃𝐒[:𝐜𝐚𝐥𝐥_𝐦𝐞])' Because 𝘚𝘢𝘧𝘦𝘵𝘺 𝘧𝘪𝘳𝘴𝘵

# 📓 P.S. 𝗙𝗲𝘄 { Hash + send } 𝘁𝗲𝗰𝗵𝗻𝗶𝗾𝘂𝗲𝘀 𝘁𝗵𝗮𝘁 𝘀𝗮𝘃𝗲 𝘆𝗼𝘂 𝟰 𝗵𝗼𝘂𝗿𝘀 𝗼𝗳 𝗣𝗿𝗼𝗱 𝗰𝗿𝗮𝘀𝗵 𝘁𝗿𝗼𝘂𝗯𝗹𝗲𝘀𝗵𝗼𝗼𝘁𝗶𝗻𝗴
# (𝑐ℎ𝑒𝑐𝑘 𝑎𝑡𝑡𝑎𝑐ℎ𝑒𝑑 𝑐𝑜𝑑𝑒 𝑠𝑛𝑖𝑝𝑝𝑒𝑡 𝑏𝑒𝑙𝑜𝑤)

# ➕Dynamically dispatch only 𝐤𝐧𝐨𝐰𝐧 methods
# ➕Explicit Nil handlers for 𝐧𝐨𝐭 𝐟𝐨𝐮𝐧𝐝 𝐤𝐞𝐲
# ➖Yh a bit ugly, but not uglier than 𝐝𝐞𝐛𝐮𝐠𝐠𝐢𝐧𝐠 headache 😡

obj.send(METHODS[:call_me])

class Song
  def foo(r = "Rose") = p "Desert #{r}"

  def bar = p "Shape of My Heart"

  private

  def prvt_biz = p "Fields of Gold"
end

s = Song.new
s.send(:foo, "Adenium obesum") # => 'Desert Adenium obesum'
s.send(:prvt_biz) # => 'Fields of Gold'
s.public_send(:bar) # => 'Shape of My Heart'
s.public_send(:prvt_biz) # => NoMethodError

# __send__
def s.send(time) = AlbumJob.perform_at(time, "The Bridge")
s.send(Time.now + 60 * 60 * 24) # => Enqueues process``
s.__send__(:foo) # => 'Desert Rose'

# [2] ProdCode tricks
SNG_MAP =
  Hash.new { raise "ErrObj Here" }
    .merge(f: :foo, b: :bar) # Your obj's API map here

params = {type: :f} # assuming dynamic params
s.public_send(SNG_MAP[params[:type]]) # => Desert Rose"

params[:type] = :qux # invalid method name
s.public_send(SNG_MAP[params[:type]]) # => RuntimeError: ErrObj Here"

# one time one liner with no-key default
s.public_send(SNG_MAP.fetch(params[:type], :bar)) # => Shape of My Heart"
