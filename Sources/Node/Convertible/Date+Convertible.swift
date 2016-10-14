import Foundation

extension Date: NodeConvertible {
    public func makeNode(context: Context = EmptyNode) -> Node {
        return .date(self)
    }

    public init(node: Node, in context: Context) throws {
        
        switch (node) {
        case .date(let date):
            self = date
        case .string(let dateString):
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            self = dateFormatter.date(from: dateString)!
       
        default:
            throw NodeError.unableToConvert(node: node, expected: "\(String.self)")
        }
    }
}
