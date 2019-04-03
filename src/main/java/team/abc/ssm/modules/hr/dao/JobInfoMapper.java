package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.JobInfo;

public interface JobInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(JobInfo record);

    int insertOrUpdate(JobInfo record);

    int insertOrUpdateSelective(JobInfo record);

    int insertSelective(JobInfo record);

    JobInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(JobInfo record);

    int updateByPrimaryKey(JobInfo record);

    int updateBatch(List<JobInfo> list);

    int batchInsert(@Param("list") List<JobInfo> list);
}