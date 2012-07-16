class StringInput < Formtastic::Inputs::StringInput
    def to_html
      puts "this is my modified version of StringInput"
      super
    end
  end