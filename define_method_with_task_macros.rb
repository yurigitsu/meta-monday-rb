# RubyMetaMonday 💻

# ⚡ May the #Metaprogramming be with you

# Let's dive into the world of DSL creation using define_method.

# What could be a more fitting example than... a TODO List:
#     𝗘𝘃𝗲𝗿𝘆𝗼𝗻𝗲 𝗼𝗻 𝘁𝗵𝗲 𝘄𝗲𝗯: 𝘕𝘰, 𝘕𝘰, 𝘕𝘰𝘰𝘰𝘰! 𝘗𝘭𝘦𝘢𝘴𝘦 𝘴𝘵𝘰𝘱 𝘸𝘪𝘵𝘩 𝘵𝘩𝘰𝘴𝘦 𝘭𝘪𝘴𝘵𝘴 <𝘤𝘳𝘺 𝘦𝘮𝘰𝘫𝘪>
#     𝗦𝘁𝗶𝗹𝗹 𝗲𝘃𝗲𝗿𝘆𝗼𝗻𝗲: 𝘓𝘦𝘵'𝘴 𝘤𝘳𝘦𝘢𝘵𝘦 𝘢 𝘛𝘖𝘋𝘖 𝘭𝘪𝘴𝘵

# The define_method technique is a powerful and easy language feature:
#     Super easy to start DSL-ninja journey
#     Used in many libraries
#     Allows the creation of methods at runtime based on various conditions,
#  inputs, or configurations.

# P.S: The only justification for the TODO example is that without this
# user-friendly DSL,there is no chance that Luke will be able to manage
# his Jedi Chords.

# #RubyMetaMonday #RubyOnRails #Ruby #SoftwareEngineer

# Luke Jedi Academy Chores
module StarWars
  class LukeChors < TodoList
    task :buy_blue_milk
    task :build_lightsaber
    task :use_force
  end
end

l = StarWars::LukeChors.new
l.status # { buy_blue_milk: 'N/A', build_lightsaber: 'N/A', use_force: 'N/A'}

l.build_lightsaber(:wip)
l.buy_blue_milk_close!

l.status # { build_lightsaber: :wip, use_force: 'N/A'}
l.its_a_trap # {buy_blue_milk: :archive, build_lightsaber: :wip, use_force: 'N/A'}

l.buy_blue_milk_refresh!
l.status # { buy_blue_milk: 'N/A', build_lightsaber: wip, use_force: 'N/A'}

# Try not. Do. Or do not. There is no try...for DSL...
class TodoList
  class << self
    def register = @register ||= {}

    def register!(li) = register[li] = "N/A"

    def task(item)
      register!(item)
      define_method(item) { |status| @sts[item] = status }
      define_method(:"#{item}_close!") { @sts[item] = :archive }
      define_method(:"#{item}_refresh!") { @sts[item] = "N/A" }
    end
  end

  # Np with clone usage unless it's 'order 66' 3:)
  def initialize = @sts = self.class.register.clone

  def status = @sts.select { |_, v| v != :archive }

  def its_a_trap = @sts
end
