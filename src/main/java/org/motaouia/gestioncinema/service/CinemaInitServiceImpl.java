package org.motaouia.gestioncinema.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.stream.Stream;

import org.motaouia.gestioncinema.dao.CategorieRepository;
import org.motaouia.gestioncinema.dao.CinemaRepository;
import org.motaouia.gestioncinema.dao.FilmRepository;
import org.motaouia.gestioncinema.dao.PlaceRepository;
import org.motaouia.gestioncinema.dao.ProjectionRepository;
import org.motaouia.gestioncinema.dao.SalleRepository;
import org.motaouia.gestioncinema.dao.SeanceRepository;
import org.motaouia.gestioncinema.dao.TicketRepository;
import org.motaouia.gestioncinema.dao.VilleRepository;
import org.motaouia.gestioncinema.models.Categorie;
import org.motaouia.gestioncinema.models.Cinema;
import org.motaouia.gestioncinema.models.Film;
import org.motaouia.gestioncinema.models.Place;
import org.motaouia.gestioncinema.models.Projection;
import org.motaouia.gestioncinema.models.Salle;
import org.motaouia.gestioncinema.models.Seance;
import org.motaouia.gestioncinema.models.Ticket;
import org.motaouia.gestioncinema.models.Ville;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CinemaInitServiceImpl implements ICinemaInitService{

	@Autowired
	private VilleRepository villeRepository;
	@Autowired
	private CinemaRepository cinemaRepository;
	@Autowired
	private SalleRepository salleRepository;
	@Autowired
	private PlaceRepository placeRepository;
	@Autowired
	private SeanceRepository seanceRepository;
	@Autowired
	private CategorieRepository categorieRepository;
	@Autowired
	private FilmRepository filmRepository;
	@Autowired
	private ProjectionRepository projectionRepository;
	@Autowired
	private TicketRepository ticketRepository;
	
	@Override
	public void initVilles() {
		Stream.of("NADOR", "TANGER", "MEKNES", "OUJDA", "CASABLANCA", "AGADIR", "DAKHELA").forEach(nomVille ->{
			Ville ville = new Ville();
			ville.setName(nomVille);
			villeRepository.save(ville);
		});
		
	}

	@Override
	public void initCinemas() {
		villeRepository.findAll().forEach(v ->{
			Stream.of("MAGARAMA", "IMAX", "DAWLIZ", "CHAHRAZAD").forEach(nameCinema ->{
				Cinema cinema = new Cinema();
				cinema.setName(nameCinema);
				cinema.setVille(v);
				cinema.setNbrSalles(3 + (int)(Math.random() * 7));
				cinemaRepository.save(cinema);
			});
		});
	}

	@Override
	public void initSalles() {
		cinemaRepository.findAll().forEach(c ->{
			for(int i=0; i<c.getNbrSalles(); i++) {
				Salle salle = new Salle();
				salle.setNom("Salle" + (i + 1));
				salle.setCinema(c);
				salle.setNbrPlaces(20 + (int)(Math.random() * 10));
				salleRepository.save(salle);
			}
			
		});
		
	}

	@Override
	public void initPlaces() {
	  salleRepository.findAll().forEach(salle ->{
		  for(int i=0; i<salle.getNbrPlaces(); i++) {
			  Place place = new Place();
			  place.setNumero(i + 1);
			  place.setSalle(salle);
			  placeRepository.save(place);
		  }
	  });
		
	}

	@Override
	public void initSeances() {
		DateFormat df = new SimpleDateFormat("HH:mm");
		Stream.of("12:00", "15:00", "17:00", "19:00", "21:00").forEach(s -> {
			Seance seance = new Seance();
			try {
				seance.setHeureDebut(df.parse(s));
				seanceRepository.save(seance);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});
		
	}

	@Override
	public void initCategories() {
		Stream.of("ACTION", "ROMANCE", "DRAMA", "COMEDY", "SIENCE FICTION").forEach(nomCategorie ->{
			Categorie categorie = new Categorie();
			categorie.setName(nomCategorie);
			categorieRepository.save(categorie);
		});
		
	}

	@Override
	public void initFilms() {
		
		double[] durrees = new double[]{1,1.5,2,2.5,3};
		List<Categorie> categories = categorieRepository.findAll();
		
		
			Stream.of("CATCH ME IF YOU CAN", "TITANIC", "INSIPTION", "The lord of the ring", "THE HOAX", "TERMINATOR")
			   .forEach(nomFilm -> {
				   
				  Film film = new Film();
				  film.setTitle(nomFilm);
				  film.setDurree(durrees[new Random().nextInt(durrees.length)]);
				  film.setPhoto(nomFilm.replaceAll(" ", ""));
				  film.setCategorie(categories.get(new Random().nextInt(categories.size())));
				  filmRepository.save(film);
				  
			});
		
		
	}

	@Override
	public void initProjections() {
		
		double[] prices = new double[]{50.00, 80.00, 100.00, 120.00};
		
		villeRepository.findAll().forEach(ville -> {
			ville.getCinemas().forEach(cinema -> {
				cinema.getSalles().forEach(salle -> {
					filmRepository.findAll().forEach(film -> {
						seanceRepository.findAll().forEach(seance -> {
							Projection projection = new Projection();
							projection.setDateProjection(new Date());
							projection.setFilm(film);
							projection.setPrix(new Random().nextInt(prices.length));
							projection.setSalle(salle);
							projection.setSeance(seance);
							projectionRepository.save(projection);
						});
					});
				});
			});
			
		});
		
	}

	@Override
	public void initTickets() {
		projectionRepository.findAll().forEach(projection -> {
			projection.getSalle().getPlaces().forEach(place -> {
				Ticket ticket = new Ticket();
				ticket.setPlace(place);
				ticket.setReservee(false);
				ticket.setPrix(projection.getPrix());
				ticket.setProjection(projection);
				ticketRepository.save(ticket);
			});
		});
		
	}

}
