class Ticket
  attr_accessor :seat_number, :passenger_name, :passenger_contact

  def initialize(seat_number)
    @seat_number = seat_number
    @passenger_name = "Empty"
    @passenger_contact = "N/A"
  end
end

class TicketReservationSystem
  MAX_SEATS = 40

  def initialize
    @seats = Array.new(MAX_SEATS) { |i| Ticket.new(i + 1) }
  end

  def display_seats
    puts "\n----- Seat Status -----"
    @seats.each do |ticket|
      puts "Seat #{ticket.seat_number}: #{ticket.passenger_name}"
    end
  end

  def book_ticket
    display_seats
    print "Enter seat number to book (1-#{MAX_SEATS}): "
    seat_number = gets.to_i

    if seat_number < 1 || seat_number > MAX_SEATS
      puts "Invalid seat number."
      return
    end

    ticket = @seats[seat_number - 1]
    if ticket.passenger_name != "Empty"
      puts "Seat already booked."
      return
    end

    print "Enter passenger name: "
    ticket.passenger_name = gets.chomp
    print "Enter passenger contact: "
    ticket.passenger_contact = gets.chomp

    puts "Ticket booked successfully for seat #{seat_number}."
  end

  def cancel_ticket
    display_seats
    print "Enter seat number to cancel (1-#{MAX_SEATS}): "
    seat_number = gets.to_i

    if seat_number < 1 || seat_number > MAX_SEATS
      puts "Invalid seat number."
      return
    end

    ticket = @seats[seat_number - 1]
    if ticket.passenger_name == "Empty"
      puts "Seat not booked yet."
      return
    end

    ticket.passenger_name = "Empty"
    ticket.passenger_contact = "N/A"

    puts "Ticket for seat #{seat_number} cancelled successfully."
  end

  def run
    loop do
      puts "\n----- Ticket Reservation System -----"
      puts "1. Book Ticket"
      puts "2. Cancel Ticket"
      puts "3. View Seats"
      puts "4. Exit"
      print "Enter your choice: "
      choice = gets.to_i

      case choice
      when 1
        book_ticket
      when 2
        cancel_ticket
      when 3
        display_seats
      when 4
        puts "Thank you for using the Ticket Reservation System."
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end
end

# Run the ticket reservation system
TicketReservationSystem.new.run
