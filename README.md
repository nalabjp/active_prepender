# ActivePrepender

This gem provides the feature to prepend together class methods of some modules

## Installation

Add to your application's Gemfile and bundle

```ruby
gem 'active_prepender'
```

## Usage

### Simple use case

```
module FeatureModule
  def my_instance_method
    "#{super} with FeatureModule"
  end

  module ClassMethods
    def my_class_method
      "#{super} with FeatureModule"
    end
  end
end

module BaseModule
  extend ActivePrepender
  include FeatureModule

  def my_instance_method
    "#{super} with BaseModule"
  end

  module ClassMethods
    def my_class_method
      "#{super} with BaseModule"
    end
  end
end

class MyClass
  prepend BaseModule

  def my_instance_method
    'my_instance_method'
  end

  class << self
    def my_class_method
      'my_class_method'
    end
  end
end

p MyClass.new.my_instance_method
# => 'my_instance_method with FeatureModule with BaseModule'

p MyClass.my_class_method
# => 'my_class_method with FeatureModule with BaseModule'

p MyClass.ancestors
# => [BaseModule, FeatureModule, MyClass, Object, PP::ObjectMixin, Kernel, BasicObject]
```

### Include nested modules

For example, you can use `ActivePrepender::WithInclude`, if you provides core module that has some features to developer.

```
module FeatureModule1
  def my_instance_method
    "#{super} with FeatureModule1"
  end

  module ClassMethods
    def my_class_method
      "#{super} with FeatureModule1"
    end
  end
end

module FeatureModule2
  def my_instance_method
    "#{super} with FeatureModule2"
  end

  module ClassMethods
    def my_class_method
      "#{super} with FeatureModule2"
    end
  end
end

module BaseModule
  extend ActivePrepender::WithInclude
  include FeatureModule1
  include FeatureModule2

  def my_instance_method
    "#{super} with BaseModule"
  end

  module ClassMethods
    def my_class_method
      "#{super} with BaseModule"
    end
  end
end

module ExtendedModule
  include BaseModule

  def my_instance_method
    "#{super} with ExtendedModule"
  end

  module ClassMethods
    def my_class_method
      "#{super} with ExtendedModule"
    end
  end
end

class MyClass
  prepend ExtendedModule

  def my_instance_method
    'my_instance_method'
  end

  class << self
    def my_class_method
      'my_class_method'
    end
  end
end

p MyClass.new.my_instance_method
# => 'my_instance_method with FeatureModule1 with FeatureModule2 with BaseModule with ExtendedModule'

p MyClass.my_class_method
# => 'my_class_method with FeatureModule1 with FeatureModule2 with BaseModule with ExtendedModule'

p MyClass.ancestors
# => [ExtendedModule, BaseModule, FeatureModule2, FeatureModule1, MyClass, Object, PP::ObjectMixin, Kernel, BasicObject]
```

### With ActiveSupport::Concern

Similar to the 'Include nested modules' you can use `ActivePrepender::WithInclude`

```
require 'active_support'

module FeatureModule1
  extend ActiveSupport::Concern

  def my_instance_method
    "#{super} with FeatureModule1"
  end

  class_methods do
    def my_class_method
      "#{super} with FeatureModule1"
    end
  end
end

module FeatureModule2
  extend ActiveSupport::Concern

  def my_instance_method
    "#{super} with FeatureModule2"
  end

  class_methods do
    def my_class_method
      "#{super} with FeatureModule2"
    end
  end
end

module BaseModule
  extend ActiveSupport::Concern
  extend ActivePrepender::WithInclude
  include FeatureModule1
  include FeatureModule2

  def my_instance_method
    "#{super} with BaseModule"
  end

  class_methods do
    def my_class_method
      "#{super} with BaseModule"
    end
  end
end

module ExtendedModule
  include BaseModule

  def my_instance_method
    "#{super} with ExtendedModule"
  end

  module ClassMethods
    def my_class_method
      "#{super} with ExtendedModule"
    end
  end
end

class MyClass
  prepend ExtendedModule

  def my_instance_method
    'my_instance_method'
  end

  class << self
    def my_class_method
      'my_class_method'
    end
  end
end

p MyClass.new.my_instance_method
# => 'my_instance_method with FeatureModule1 with FeatureModule2 with BaseModule with ExtendedModule'

p MyClass.my_class_method
# => 'my_class_method with FeatureModule1 with FeatureModule2 with BaseModule with ExtendedModule'

p MyClass.ancestors
# => [ExtendedModule, BaseModule, FeatureModule2, FeatureModule1, MyClass, Object, PP::ObjectMixin, Kernel, BasicObject]
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

