package pr.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import org.springframework.stereotype.Service;

import pr.dao.TypeDao;
import pr.domain.BaseEntity;
import pr.domain.Type;
import pr.domain.TypeAssociation;
import pr.domain.Unit;
import pr.domain.UnitAssociation;


@Service
public class DatabaseService extends GenericService {

	
	
	
	// Properties

	
	
    private EntityManager 	em;

	@Resource
	private TypeDao 		typeDao;
	
	
	
	
    // Insert test data
    
	
	
	
	public void insertTestData() {
		deleteExistingData();

		EntityManagerFactory emf = GenericService.getEntityManagerFactory();
    	em = emf.createEntityManager();
		
		insertTestTypes();
		insertTestUnits();
		
		em.close();
		emf.close();
	}


	
	private void insertTestTypes() {
		em.getTransaction().begin();

	    Type tKU = createType("K�?", "Küla");
	    Type tVA = createType("VA", "Vald");
	    Type tKI = createType("KI", "Kihelkond");
	    Type tMA = createType("MA", "Maakond");
	    Type tRI = createType("RI", "Riik");

	    addBossToType(tVA, tKU);
	    addBossToType(tKI, tVA);
	    addBossToType(tMA, tKI);
	    addBossToType(tRI, tMA);

	    em.getTransaction().commit();
	}

	
	private Type createType(String code, String name) {
		Type type = new Type();
		
		type.setCode(code);
		type.setName(name);
		type.setOpened(getStartOfTimeDate());
		type.setFromDate(getStartOfTimeDate());
		type.setToDate(BaseEntity.getEndOfTimeDate());
		
		em.persist(type);
		return type;
	}


	private void addBossToType(Type boss, Type type) {
		if (boss == null || type == null) return; 
		
		List<TypeAssociation> typeAssociations = new ArrayList<TypeAssociation>();		
		TypeAssociation typeAssociation = new TypeAssociation();
		typeAssociation.setBoss(boss);
		typeAssociation.setSubOrdinate(type);
		  
		typeAssociation.setBossId(boss.getId());
		typeAssociation.setSubOrdinateId(type.getId());
		typeAssociation.setOpened(getStartOfTimeDate());
		
		em.persist(typeAssociation);
		
		typeAssociations.add(typeAssociation);
		type.setBossAssociations(typeAssociations);
		boss.setSubOrdinateAssociations(typeAssociations);		
	}


	
	
	private void insertTestUnits() {
		em.getTransaction().begin();

	    Unit uKU01 = createUnit("K�?01", "Kassi küla", "K�?");
	    Unit uKU02 = createUnit("K�?02", "Toku küla",  "K�?");
	    Unit uKU03 = createUnit("K�?03", "Londi küla", "K�?");
	    Unit uKU04 = createUnit("K�?04", "Lusti küla", "K�?");
	    
	    Unit uVA01 = createUnit("VA01", "Urvaste vald", "VA");
	    Unit uVA02 = createUnit("VA02", "Karula vald",  "VA");

	    Unit uKI01 = createUnit("KI01", "Urvaste kihelkond", "KI");
	    Unit uKI02 = createUnit("KI02", "Karula kihelkond",  "KI");

	    Unit uMA01 = createUnit("MA01", "Võru maakond", "MA");

	    Unit uRI01 = createUnit("RI01", "Eesti riik", "RI");

	    
	    addBossToUnit(uVA01, uKU01);
	    addBossToUnit(uVA01, uKU02);
	    addBossToUnit(uVA02, uKU03);
	    addBossToUnit(uVA02, uKU04);

	    addBossToUnit(uKI01, uVA01);
	    addBossToUnit(uKI02, uVA02);

	    addBossToUnit(uMA01, uKI01);
	    addBossToUnit(uMA01, uKI02);

	    addBossToUnit(uRI01, uMA01);
	    
	    em.getTransaction().commit();
	}

	
	private Unit createUnit(String code, String name, String typeCode) {
		Integer typeId = typeDao.getTypeIdByCode(typeCode); 
		
		Unit unit = new Unit();
	
		unit.setCode(code);
		unit.setName(name);
		unit.setOpened(getStartOfTimeDate());
		unit.setFromDate(getStartOfTimeDate());
		unit.setToDate(BaseEntity.getEndOfTimeDate());
		unit.setTypeId(typeId);
		
		em.persist(unit);
		return unit;
	}

	
	private void addBossToUnit(Unit boss, Unit unit) {
		if (boss == null || unit == null) return; 
		
		List<UnitAssociation> unitAssociations = new ArrayList<UnitAssociation>();		
		UnitAssociation unitAssociation = new UnitAssociation();
		unitAssociation.setBoss(boss);
		unitAssociation.setSubOrdinate(unit);
		  
		unitAssociation.setBossId(boss.getId());
		unitAssociation.setSubOrdinateId(unit.getId());
		unitAssociation.setOpened(getStartOfTimeDate());
		em.persist(unitAssociation);
		
		unitAssociations.add(unitAssociation);
		unit.setBossAssociations(unitAssociations);
		boss.setSubOrdinateAssociations(unitAssociations);		
	}
	
	
	private Date getStartOfTimeDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date openDate = null;
		try {
			openDate = sdf.parse("2012-01-01");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return openDate;
	}
	
	
	// Delete existing data 
	

	
	public void deleteExistingData() {
		EntityManagerFactory emf = GenericService.getEntityManagerFactory();
    	em = emf.createEntityManager();
		em.getTransaction().begin();
	
		em.createQuery("DELETE FROM TypeAssociation").executeUpdate(); 
	    em.createQuery("DELETE FROM Type").executeUpdate();

	    em.createQuery("DELETE FROM UnitAssociation").executeUpdate();
	    em.createQuery("DELETE FROM Unit").executeUpdate();		
	   
	    em.getTransaction().commit();
		em.close();
		emf.close();
	}


	
	
	// Delete database / Clear DB lock

	

	public String deleteDatabase() {
		String result = "";
		
		try {
			
			File scriptfile	 	= new File("/usr/share/tomcat7/i377/Team01d2MVC/db.script");
			File propertiesfile = new File("/usr/share/tomcat7/i377/Team01d2/db.properties");
			
			
			result = clearDbLock();
			
			if (scriptfile.delete()) {
				result = result + " " + scriptfile.getName() + " is deleted.";
			} else {
				result = result + " " + "Script file delete failed: "+scriptfile.getAbsolutePath();
			}
			
			if (propertiesfile.delete()) {
				result = result + " " + propertiesfile.getName() + " is deleted.";
			} else {
				result = result + " " + "Properties file delete failed: "+propertiesfile.getAbsolutePath();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	

	public String clearDbLock() {
		String clearResult = "";
		
		try {
			
			File lockfile 		= new File("/usr/share/tomcat7/i377/Team01d2/db.lck");
			
			if (lockfile.delete()) {
				clearResult = lockfile.getName() + " is deleted.";
			} else {
				clearResult = "Lock file delete failed: "+lockfile.getAbsolutePath();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return clearResult;
	}
	
}

