package org.motaouia.gestioncinema.dao;

import org.motaouia.gestioncinema.models.Projection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource
public interface ProjectionRepository extends JpaRepository<Projection, Long>{

}
