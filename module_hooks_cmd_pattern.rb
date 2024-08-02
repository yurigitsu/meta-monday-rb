# #RubyMetaMonday 💻

# ⚡ Unleash Power of #Metaprogramming in Ruby with Harnessing Built-in
# #ModuleHooks for Dynamic Code Generation and Runtime Customization
# ⚙️ The most frequently used technique is adding both class and
# instance methods from module. Your { self.<hook_method_below> } buddies are:

# ✔️ 'included'
# ✔️ 'extended'
# ✔️ 'prepended'

# 🔎 Let's explore how we can apply this feature to widely used approaches
# for defining command-like behavior to encapsulate business logic in a
# reusable and modular way such as: Commands, ServiceObject, CommandObject
#  or whatever your 'it works on my local machine' 😎 friend calls it.
# #Rails likes it too. Check ActiveSupport::Concern and don't make community angry 😜

# #RubyMetaMonday #RubyOnRails #Ruby #SoftwareEngineer #WeNeedMorePatternsMore

module CmdCall
  def self.included(base)
    base.extend(ClassMethods)
    base.private_class_method :new
  end

  # instance methods
  def log_cmd(name) = p "[LOGGER:] CMD: #{self.class.name} | STAGE: #{name}"

  # class smethods
  module ClassMethods
    def call(...) = new.call(...)
  end
end

class MeaningfulEvent
  include CmdCall

  def call(data)
    p "Meaning of life is #{data}"
    log_cmd "Hitchhiker's Guide to the Galaxy"
  end
end

MeaningfulEvent.call(42)
# => "Meaning of life is 42"
# => "[LOGGER:] CMD: MeaningfulEvent | STAGE: Hitchhiker's Guide to the Galaxy"

MeaningfulEvent.new
# => NoMethodError: private method `new' called for class MeaningfulEvent
