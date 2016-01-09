class Message < ActiveRecord::Base
    # 名前は必須入力かつ２０文字以内
    validates :name, length: { maximum: 20}, presence: true
    # 内容は必須入力かつ２文字以上３０文字以下
    validates :body, length:{minimum: 2, maximum: 30}, presence: true
    # 年齢は必須入力かつ0以上
    validates :age, numericality:{ greater_than_or_equal_to: 0, only_integer: true }, presence: true
    
    def age=(value)
        value.tr!('０-９', '0-9') if value.is_a?(String)
        super(value)
    end
    
    
end
