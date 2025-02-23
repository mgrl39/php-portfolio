<?php

require_once "DatabaseController.php";

class ProjectController {

	private $connection;

	public function __construct() {
		$this->connection = DatabaseController::connect();
	}

	public function getProjects() {

		try  {

			$sql = "SELECT * 
				FROM Project
				WHERE 1";

			$statement = $this->connection->prepare($sql);
			//$statement->setFetchMode(PDO::FETCH_INTO, new stdClass);
			$statement->setFetchMode(PDO::FETCH_OBJ);
			$statement->execute();

			$result = $statement->fetchAll();

			return $result;

		} catch(PDOException $error) {
			echo $sql . "<br>" . $error->getMessage();
		}
	}

	public function getPrincipalDeveloper() {

		try {
			$sql = "SELECT *
				FROM Developer
				WHERE 1";

			$statement = $this->connection->prepare($sql);
			//$statement->setFetchMode(PDO::FETCH_INTO, new stdClass);
			$statement->setFetchMode(PDO::FETCH_OBJ);
			$statement->execute();

			$result = $statement->fetchAll();

			return $result;

		} catch(PDOException $error) {
			echo $sql . "<br>" . $error->getMessage();
		}

	}

	public function getTechnologiesByProject($projectId) {
		try {
			$sql = "SELECT t.* FROM Technology t 
				JOIN ProjectTechnology pt ON t.id = pt.technologyId 
				WHERE pt.projectId = :projectId";
			$statement = $this->connection->prepare($sql);
			$statement->bindParam(':projectId', $projectId, PDO::PARAM_INT);
			$statement->execute();
			return $statement->fetchAll(PDO::FETCH_ASSOC);
		} catch(PDOException $error) {
			echo $error->getMessage();
			return [];
		}
	}

	public function getEducationDeveloper($developerId) {
		try {
			$sql = "SELECT * From Education where Education.developer_id = :developerId";
			$statement = $this->connection->prepare($sql);
			$statement->bindParam(':developerId', $developerId, PDO::PARAM_INT);
			$statement->execute();
			return $statement->fetchAll(PDO::FETCH_ASSOC);

		} catch(PDOException $error) {
			echo $sql . "<br>" . $error->getMessage();
		}
	}

	public function getImageByProjectId($projectId) {
		
		try {
			$sql = "SELECT i.path FROM ProjectImage pi
				JOIN Image i ON pi.imageId = i.id
				WHERE pi.projectId = :projectId";
			$statement = $this->connection->prepare($sql);
			$statement->bindParam(':projectId', $projectId, PDO::PARAM_INT);
			$statement->execute();
			return $statement->fetch(PDO::FETCH_ASSOC);
		} catch(PDOException $error) {
			echo $error->getMessage();
			return [];
		}
	}
	public function getImageByImageId($imageId) {
		try {
			$sql = "SELECT path FROM Image WHERE id = :imageId";
			$statement = $this->connection->prepare($sql);
			$statement->bindParam(':imageId', $imageId, PDO::PARAM_INT);
			$statement->execute();
			$result = $statement->fetch(PDO::FETCH_ASSOC);
			return $result ? $result['path'] : null; // Retorna solo el path
		} catch(PDOException $error) {
			echo $error->getMessage();
			return null; // Devuelve null en caso de error
		}
	}
	
}