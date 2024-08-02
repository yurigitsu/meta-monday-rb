# ⚡ Everything but the  #Metaprogramming. Hold on ...How about  NO 🥊🐻

# In situations where you call a non-existent method (send a message to the
# object if you are a true 🦸 OOP-hero), the 𝗥𝘂𝗯𝘆 𝗢𝗯𝗷𝗲𝗰𝘁 𝗠𝗼𝗱𝗲𝗹  provides you
# with a built-in last resort to 'put your 𝚕̶𝚒̶𝚏̶𝚎̶ ̶code together' before
# raising an error 🧨.

# 🎸🎵 Fortunately, you won't miss the presence of 𝗺𝗲𝘁𝗵𝗼𝗱_𝗺𝗶𝘀𝘀𝗶𝗻𝗴,
# like deserts  miss the rain. (EBTG)

# Design Patterns like "𝙥𝙧𝙚𝙨𝙚𝙣𝙩𝙚𝙧", "𝙚𝙭𝙝𝙞𝙗𝙞𝙩", "𝙫𝙞𝙚𝙬 𝙢𝙤𝙙𝙚𝙡" or "𝙙𝙚𝙘𝙤𝙧𝙖𝙩𝙤𝙧" might
# utilize 👻 𝗚𝗵𝗼𝘀𝘁 𝗺𝗲𝘁𝗵𝗼𝗱𝘀 👻 (another fancy name for '𝘮𝘪𝘴𝘴𝘪𝘯𝘨 𝘮𝘦𝘵𝘩𝘰𝘥𝘴')
# to solving common use cases:

# ➕ Encapsulate the presentation logic
# ➕ Enhance object behavior without impacting the source
# ➕ Replace procedural, object-disoriented helpers

# 🤖 So let's jump real quick into the #Cyberpunk world and put our
# 👻 Ghost in the Shell 🦾.

# 📝 The only rule of thumb: (... actually duo 🐫 )

# ✔ Override 𝗿𝗲𝘀𝗽𝗼𝗻𝗱_𝘁𝗼_𝗺𝗶𝘀𝘀𝗶𝗻𝗴? 𝑡𝑜 𝑢𝑠𝑒 𝑟𝑒𝑠𝑝𝑜𝑛𝑑_𝑡𝑜? 𝑎𝑛𝑑 .𝑚𝑒𝑡ℎ𝑜𝑑()
# ✔ use 𝘀𝘂𝗽𝗲𝗿 𝑡𝑜 𝑡ℎ𝑒 𝑔𝑖𝑣𝑒 𝑝𝑎𝑟𝑒𝑛𝑡 𝑐𝑙𝑎𝑠𝑠 𝑙𝑎𝑠𝑡 𝑠ℎ𝑜𝑡

class Cyberthetic
  attr_reader :cortex, :hack

  # What a hacker with no privacy brake =)
  def initialize(cortex, hack: false)
    @cortex, @hack = cortex, hack
  end

  def method_missing(m, *, &)
    return super unless cortex.respond_to?(m, hack)

    # Allows to access private methods
    hack ? cortex.__send__(m, *, &) : cortex.public_send(m, *, &)
  end

  def respond_to_missing?(m, pv)
    cortex.respond_to?(m, hack) || super
  end
end

class Ghost
  def name = "Motoko Kusanagi"

  def rank = "The Major"

  private def task_force = "Section 9"
end

class Shell < Cyberthetic
  def therm_optic = "Kiroshi Optics"

  def invisibility = "Adreno-trigger"
end

agent = Shell.new(Ghost.new)
agent.name # => 'Motoko Kusanagi'
agent.therm_optic # => 'Kiroshi Optics'

major = Shell.new(Ghost.new, hack: true)
major.task_force # => 'Section 9
major.respond_to?(:name) # => true
major.method(:name) # => #<Method: Shell#name(*)>
