import mongoose from "mongoose";

interface TodoI {
  title: string;
  description: string;
}

interface TodoDocument extends mongoose.Document {
  title: string;
  description: string;
}
// //Delete request
// Future deleteData(String id) async {
//   final Uri restAPIURL =
//       Uri.parse("https://todoflutternodejs.herokuapp.com/delete");

//   http.Response response = await httpClient.delete(restAPIURL,
//       headers: customHeaders, body: jsonEncode(id));

//   return response.body;
// }
const todoSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    required: false,
  },
});

interface todoModelInterface extends mongoose.Model<TodoDocument> {
  set(x: TodoI): TodoDocument;
}

todoSchema.statics.set = (x: TodoI) => {
  return new Todo(x);
};

const Todo = mongoose.model<TodoDocument, todoModelInterface>(
  "Todo",
  todoSchema
);

Todo.set({
  title: "some title",
  description: "some description",
});

export { Todo };
