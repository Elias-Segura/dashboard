class RecentUser {
  final name, date, posts, role, email, tickets;

  RecentUser(
      {this.name, this.date, this.posts, this.role, this.email, this.tickets});
}

List recentUsers = [
  RecentUser(
    name: "Elias Segura ",
    email: "elias.es280@gmail.com",
    date: "01-03-2021",
    tickets: 4,
    posts: "4",
  ),
  RecentUser(
    name: "Cristopher Galeano",
    email: "estugale28@gmail.com",
    date: "01-03-2021",
    tickets: 7,
    posts: "4",
  ),
];
