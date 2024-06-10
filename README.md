# Course and Tutor Management App

This is a Ruby on Rails application that manages courses and tutors. In this application, a course can have many tutors, but a tutor can belong to only one course.

## Features

- Create courses with associated tutors
- List all courses with their tutors
- Validate uniqueness and presence of course and tutor names

## Getting Started

These instructions will help you set up and run the project on your local machine for development and testing purposes.

### Prerequisites

Make sure you have the following installed on your local machine:

- Ruby (version 3.1.0 or later)
- Rails (version 7.2.0.beta2 or later)
- SQLite3 (or your preferred database)

### Installation

1. Clone the repository

```bash
git clone https://github.com/your-repo.git
cd your-repo
```

2. Install the required gems

```bash
bundle install
```

3. Set up the database

```bash
rails db:create
rails db:migrate
rails db:seed
```

### Running the Application

Start the Rails server

```bash
rails server
```

Visit `http://localhost:3000` in your web browser to view the application.

### API Endpoints

#### Create a Course with Tutors

**POST /courses**

Request body example:

```json
{
  "course": {
    "name": "Ruby on Rails",
    "tutors_attributes": [
      { "name": "John Doe" },
      { "name": "Jane Smith" }
    ]
  }
}
```

#### List All Courses with Their Tutors

**GET /courses**

Response example:

```json
[
  {
    "id": 1,
    "name": "Ruby on Rails",
    "tutors": [
      {
        "id": 1,
        "name": "John Doe",
        "course_id": 1
      },
      {
        "id": 2,
        "name": "Jane Smith",
        "course_id": 1
      }
    ]
  }
]
```

### Running Tests

This project uses RSpec for testing. To run the tests, execute:

```bash
bundle exec rspec
```

### Debugging

If you encounter issues, you can use the Rails logger or debugging tools like `byebug` or `pry` to inspect the state of your application.

Add `byebug` or `binding.pry` in your code where you want to start the debugging session.

### Deployment

To deploy this application, you will need to set up your server environment with the required Ruby, Rails, and database versions. Follow the instructions for your deployment platform (e.g., Heroku, AWS, DigitalOcean) to deploy a Rails application.

### Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Create a new Pull Request

### License

This project is licensed under the MIT License. See the LICENSE file for details.

### Acknowledgments

- [Rails Documentation](https://guides.rubyonrails.org/)
- [RSpec Documentation](https://rspec.info/documentation/)

```

This `README.md` file provides a comprehensive overview of the application, including setup instructions, API endpoints, testing, and contribution guidelines. Adjust the repository URL and any other specifics to match your actual project details.